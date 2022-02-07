// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract examplemodifier{
    address public owner;
    uint256 public account;

    constructor(){
        owner = msg.sender;
        account = 0;
    }
    // 这个合约只定义一个修饰器，但并未使用： 它将会在派生合约中用到。
    // 修饰器所修饰的函数体会被插入到特殊符号 _; 的位置。
    // 这意味着如果是 owner 调用这个函数，则函数会被执行，否则会抛出异常。
    modifier onlyOwner(){
        require(msg.sender == owner, "Only Owner");
        _;
    }

    modifier valid100(uint256 _account){
        require(_account > 100, "valid 100");
        _;
    }

    function updateAccount(uint256 _account) public onlyOwner valid100(_account){
        account = _account;
    }

}
