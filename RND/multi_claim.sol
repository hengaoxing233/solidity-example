// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

interface airdrop {
    function transfer(address recipient, uint256 amount) external;
    function balanceOf(address account) external view returns (uint256);
    function claim() external;
}

contract multiCall{
    //这里填代币的合约地址
    address constant contra = address(0xc40D83B7862F7E611cD8266233E55731B36B7502);
    function call(uint256 times) public {
        for(uint i=0;i<times;++i){
            new claimer(contra);
        }
    }
}
contract claimer{
    constructor(address _contra){
        airdrop(_contra).claim();
        uint256 balance = airdrop(_contra).balanceOf(address(this));
        require(balance>0,'Oh no');
        //tx.origin 交易最初发起者
        airdrop(_contra).transfer(address(tx.origin), balance);
        selfdestruct(payable(address(msg.sender)));
    }
}
