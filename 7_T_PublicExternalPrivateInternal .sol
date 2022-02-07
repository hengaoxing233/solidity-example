// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract ExamplePublicExternalPrivateInternal{

    uint age = 100;

    //可以内部和外部(任何一个地方)调用
    function getAgeWithPublic() public view returns(uint){
        return age;
    }

    //可以内部使用,可以被子类调用
    function getAgeWithInternal() internal view returns(uint){
        return age;
    }

    //只能自己内部调用
    function getAgeWithPrivate() private view returns(uint){
        return age;
    }

    //只能外部调用
    function getAgeWithExternal() external view returns(uint){
        return age;
    }

    function callFunction() public view returns(uint){
        return getAgeWithPrivate();
    }
}
