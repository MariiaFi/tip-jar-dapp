// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

/// @title TipJar - a simple contract to collect ETH tips with messages
/// @author Maria
/// @notice Learning project for my #100DaysOfSolidity journey

contract TipJar {
    /// This event helps us log every time someone sends a tip.
    /// We can later use this in the frontend to show a list of tips.
    event NewTip(address indexed from, uint amount, string message);

    /// A Tip struct stores one donation: who sent it, how much ETH, and their message.
    struct Tip {
        address from;
        uint amount;
        string message;
    }

    /// This array will hold all the tips sent to the contract.
    Tip[] public tips;

    /// This is the main function where people send their tips.
    /// It’s payable, so they can send ETH with it.
    function sendTip(string calldata message) public payable {
        // Just to make sure they don’t send 0 ETH
        require(msg.value > 0, "Send some ETH");

        // Save the tip to our array
        tips.push(Tip(msg.sender, msg.value, message));

        // Emit the event so we can track this on the frontend or Etherscan
        emit NewTip(msg.sender, msg.value, message);
    }

    /// This function returns the full list of tips.
    /// We'll use this to display tips on the website.
    function getTips() public view returns (Tip[] memory) {
        return tips;
    }
}
