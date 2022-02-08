// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

library SafeMath{
    function add(uint a,uint b) internal pure returns(uint){
        uint c = a + b;
        assert(c >= a);
        return c;
    }

    function sub(uint a,uint b) internal pure returns(uint){
        assert(b <= a);
        return a - b;
    }

}

contract Example{
    using SafeMath for uint;

    function doAdd(uint _a,uint _b) public pure returns(uint){
        return _a.add(_b);
    }

    function doSub(uint _a,uint _b) public pure returns(uint){
        return _a.sub(_b);
    }
}
