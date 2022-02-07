// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract ExampleConstantImmutable{

    //constant声明的变量必须赋值,编译后不能修改
    string constant name = "hengaoxing";
    //部署合约后不能再修改,必须在构造函数里初始化
    uint immutable age;

    constructor(){
        age = 80;
    }

    function getName() public pure returns(string memory){
        return name;
    }

    function getAge() public view returns(uint){
        return age;
    }

}
