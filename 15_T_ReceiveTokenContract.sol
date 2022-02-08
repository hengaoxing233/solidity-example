// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract ExampleReceiveTokenContract{

    IERC20 myToken;

    constructor(address _tokenAddress){
        myToken = IERC20(_tokenAddress);

    }

    function transferFrom(uint _amount) public{
        //将token经过合约转账必须使用transferFrom,否则是由合约转出币而不是发送者的账号
        myToken.transferFrom(msg.sender,address(this),_amount);
    }

    function getBalance(address _address) public view returns(uint){
        return myToken.balanceOf(_address);
    }
}
