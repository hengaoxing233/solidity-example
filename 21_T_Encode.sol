// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract A{
    
    
    function callBFunction(address _address,uint256 _num,string memory _message) public returns(bool){
        //方法一
        /*
        (bool success,) = _address.call(
            abi.encodeWithSignature("BFunction(uint256,string)",_num,_message)
        );
        return success;
        */

        //方法二
        /* 不推荐该方法,测试中_message编码错误
        bytes4 sig = bytes4(keccak256("BFunction(uint256,string)"));
        bytes memory _bNum = abi.encode(_num);
        bytes memory _bMessage = abi.encode(_message);
        (bool success,) = _address.call(abi.encodePacked(sig,_bNum,_bMessage));
        return success;
        */

        //方法三
        /*
        bytes4 sig = bytes4(keccak256("BFunction(uint256,string)"));
        //还有abi.encode() 方法,在4.0以前常用,现在不推荐
        (bool success,) = _address.call(abi.encodeWithSelector(sig,_num,_message));
        return success;
        */

        //方法四
        B contractB = B(_address);
        (uint256 num,string memory message) = contractB.BFunction(_num,_message);
        // num,message在这里未使用,可以添加emit日志输出
        return true;

    }
    

}

contract B{

    uint256 public num;
    string public message;

    function BFunction(uint256 _num,string memory _message) public returns(uint256,string memory){
        num = _num;
        message = _message;
        return (num,message);
    }
}
