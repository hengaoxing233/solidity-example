// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

//枚举
contract ExampleEnum{
    //枚举可用来创建由一定数量的“常量值”构成的自定义类型
    enum Status{OFF,ON}

    Status status;

    function getStatus() view external returns(Status){
        return status;
    }

    function setStatus(Status _status) external{
        status = _status;
    }

    function setStatus_ON() external{
        status = Status.ON;
    }

    function setStatus_OFF() external{
        status = Status.OFF;
    }

    function reset() external{
        delete status;
    }

    function getKeyByValue(Status _status) pure external returns(string memory){
        if(Status.OFF == _status) return "OFF";
        if(Status.ON == _status) return "ON";
        return "";
    }

    function getValueByKey(string memory _status) pure external returns(Status){
        if(keccak256(bytes(_status)) == keccak256(bytes("OFF"))) return Status.OFF;
        if(keccak256(bytes(_status)) == keccak256(bytes("ON"))) return Status.ON;
        revert();//报错
    }
}
