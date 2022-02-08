// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Hengaoxing is ERC20, Ownable {
    constructor() ERC20("hengaoxing", "HGX") {
        _mint(msg.sender, 1000000 * 10 ** decimals());
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }
    //renounceOwnership 丢掉管理员权限
    //transferOwnership 转让管理员权限
    
}
