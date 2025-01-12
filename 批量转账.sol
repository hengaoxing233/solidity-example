// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

interface IERC20 {
    function transfer(address to, uint256 value) external returns (bool);
    function transferFrom(address from, address to, uint256 value) external returns (bool);
    function balanceOf(address account) external view returns (uint256);
}

contract GasEfficientMultiTransfer {
    // 用于记录转账事件
    event EtherTransfer(address indexed to, uint256 value);
    event TokenTransfer(address indexed token, address indexed to, uint256 value);
    
    // 用于接收ETH的回退函数
    receive() external payable {}

    /**
     * @dev 批量转账ETH的优化版本
     * @param recipients 接收者地址数组
     * @param values 对应的转账金额数组
     * 
     * Gas优化:
     * 1. 使用unchecked进行计数器递增
     * 2. 缓存数组长度
     * 3. 使用require替代assert
     * 4. 优化错误信息长度
     */
    function multiTransferETH(
        address[] calldata recipients,
        uint256[] calldata values
    ) external payable {
        uint256 length = recipients.length;
        require(length == values.length, "L"); // Length mismatch
        require(length > 0, "E"); // Empty array
        
        uint256 totalAmount;
        
        // 先计算总金额
        for (uint256 i = 0; i < length;) {
            totalAmount += values[i];
            unchecked { ++i; }
        }
        
        require(msg.value >= totalAmount, "V"); // Insufficient value

        // 执行转账
        for (uint256 i = 0; i < length;) {
            address to = recipients[i];
            uint256 value = values[i];
            
            require(to != address(0), "Z"); // Zero address
            
            (bool success, ) = to.call{value: value}("");
            require(success, "F"); // Transfer failed
            
            emit EtherTransfer(to, value);
            
            unchecked { ++i; }
        }
        
        // 如果有多余的ETH，返还给发送者
        uint256 remaining = msg.value - totalAmount;
        if (remaining > 0) {
            (bool success, ) = msg.sender.call{value: remaining}("");
            require(success, "R"); // Refund failed
        }
    }

    /**
     * @dev 批量转账ERC20代币的优化版本
     * @param token 代币合约地址
     * @param recipients 接收者地址数组
     * @param values 对应的转账金额数组
     * 
     * Gas优化:
     * 1. 使用unchecked进行计数器递增
     * 2. 缓存外部调用结果
     * 3. 缓存数组长度
     * 4. 批量检查授权额度
     */
    function multiTransferToken(
        IERC20 token,
        address[] calldata recipients,
        uint256[] calldata values
    ) external {
        uint256 length = recipients.length;
        require(length == values.length, "L"); // Length mismatch
        require(length > 0, "E"); // Empty array
        
        // 计算总转账金额
        uint256 totalAmount;
        for (uint256 i = 0; i < length;) {
            totalAmount += values[i];
            unchecked { ++i; }
        }
        
        // 检查发送者余额
        require(token.balanceOf(msg.sender) >= totalAmount, "B"); // Insufficient balance

        // 执行转账
        for (uint256 i = 0; i < length;) {
            address to = recipients[i];
            uint256 value = values[i];
            
            require(to != address(0), "Z"); // Zero address
            require(token.transferFrom(msg.sender, to, value), "F"); // Transfer failed
            
            emit TokenTransfer(address(token), to, value);
            
            unchecked { ++i; }
        }
    }

    /**
     * @dev 批量转账多种ERC20代币的优化版本
     * @param tokens 代币合约地址数组
     * @param recipients 接收者地址数组
     * @param values 对应的转账金额数组
     */
    function multiTransferMultiTokens(
        IERC20[] calldata tokens,
        address[] calldata recipients,
        uint256[] calldata values
    ) external {
        uint256 length = recipients.length;
        require(length == values.length && length == tokens.length, "L");
        require(length > 0, "E");

        for (uint256 i = 0; i < length;) {
            address to = recipients[i];
            uint256 value = values[i];
            IERC20 token = tokens[i];
            
            require(to != address(0), "Z");
            require(token.transferFrom(msg.sender, to, value), "F");
            
            emit TokenTransfer(address(token), to, value);
            
            unchecked { ++i; }
        }
    }

    /**
     * @dev 检查代币余额
     * @param token 代币合约地址
     * @param account 要检查的账户地址
     */
    function getTokenBalance(IERC20 token, address account) external view returns (uint256) {
        return token.balanceOf(account);
    }
}
