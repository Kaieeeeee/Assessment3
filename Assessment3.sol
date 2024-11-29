// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Assessment3 is ERC20, Ownable {
    constructor() ERC20("Assessment3", "Kyla Beatrice") Ownable(msg.sender) {}

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function burn(uint256 amount) public {
        _burn(_msgSender(), amount);
    }

    function transfer(address recipient, uint256 amount) public override returns (bool) {
        require(balanceOf(_msgSender()) >= amount, "Transfer failed: not enough balance");
        return super.transfer(recipient, amount);
    }
}
