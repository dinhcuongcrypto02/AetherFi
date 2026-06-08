// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract AetherFi is ERC20, Ownable {

    uint256 public constant MAX_SUPPLY =
        20_000_000 * 10 ** 18;

    event TokensMinted(
        address indexed to,
        uint256 amount
    );

    event TokensBurned(
        address indexed from,
        uint256 amount
    );

    constructor()
        ERC20("AetherFi", "AETH")
        Ownable(msg.sender)
    {
        _mint(
            msg.sender,
            2_000_000 * 10 ** decimals()
        );
    }

    function mint(address to, uint256 amount)
        external
        onlyOwner
    {
        require(
            totalSupply() + amount <= MAX_SUPPLY,
            "Max supply exceeded"
        );

        _mint(to, amount);

        emit TokensMinted(to, amount);
    }

    function burn(uint256 amount) external {

        _burn(msg.sender, amount);

        emit TokensBurned(msg.sender, amount);
    }

    function circulatingSupply()
        external
        view
        returns (uint256)
    {
        return totalSupply();
    }
}
