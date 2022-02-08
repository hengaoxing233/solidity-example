// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

interface IEmployee{
    function setName(string memory _name) external;
    function getName() external view returns(string memory);
}

contract Employee is IEmployee{
    string private name;

    function setName(string memory _name) public override{
        name = _name;
    }

    function getName() public override view returns(string memory){
        return name;
    }
}

contract Company{

    IEmployee employee;

    constructor(address _address){
        employee = IEmployee(_address);
    }

    function setName(string memory _name) public {
        employee.setName(_name);
    }

    function getName() public view returns(string memory){
        return employee.getName();
    }
}
