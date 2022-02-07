// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

error Unauthorized(string error,address _address);

contract ExampleError{

    address payable owner = payable(msg.sender);

    function withraw() public{
        if(msg.sender != owner) revert Unauthorized("Unauthorized",msg.sender);

        owner.transfer(address(this).balance);
    }
}
