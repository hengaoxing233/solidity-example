// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract A{
    uint private num;
    
    function setNum(uint _num) public{
        num = _num + 1;
    }

    function getNum() public view returns(uint){
        return num;
    }

    function BSetNum(address _bAddress,uint _num) public{
        B b = B(_bAddress);
        b.setNum(_num);
    }

    function bSetNumCall(address _bAddress,uint _num) public{
        (bool res,) = _bAddress.call(abi.encodeWithSignature("setNum(uint256)",_num));
        if(!res) revert();
    }

    //delegatecall 相当于让当前合约调用其他合约的方法重写自己的方法
    function bSetNumDeleGateCall(address _bAddress,uint _num) public{
        (bool res,) = _bAddress.delegatecall(abi.encodeWithSignature("setNum(uint256)",_num));
        if(!res) revert();
    }
}

contract B{
    uint private num;

    function setNum(uint _num) public{
        num = _num + 2;
    }

    function getNum() public view returns(uint){
        return num;
    }
}
