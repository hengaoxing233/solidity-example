// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract ExampleViewPure{

    uint public age;

    function increaseAge() public{
        age++;
    }

    function getAgeWithView() public view returns(uint){
        //age++; 添加了view修饰符就不能进行修改,相当于只读
        return age;
    }

    function getAgeWithPure() public pure returns(uint){
        //age++; 添加了pure修饰符只能读写当前方法内的参数,不能读写全局变量
        return 100;
    }
}
