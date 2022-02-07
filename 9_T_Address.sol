// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract ExampleAddress{

    address owner;

    constructor(){
        //相当于初始化管理员地址为创建合约的账号地址
        owner = msg.sender;
    }

    //获取当前合约地址
    function getContractAddress() external view returns(address){
        return address(this);
    }

    //获取当前调用合约的账号地址
    function getSenderAddress() external view returns(address){
        return msg.sender;
    }

    //获取改合约管理员地址
    function getOwnerAddress() external view returns(address){
        return owner;
    }

    function getBalance() external view returns(uint,uint,uint){
        uint contractBalance = address(this).balance;
        uint senderBalance = msg.sender.balance;
        uint ownerBalance = owner.balance;
        return (contractBalance,senderBalance,ownerBalance);
    }
}
