// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {MoodNFT} from "../src/MoodNFT.sol";
import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";

contract DeployMoodNFT is Script {
    function run() public returns (MoodNFT) {
        string memory sadSvg = vm.readFile("./images/dynamicNFT/sad.svg");
        string memory happySvg = vm.readFile("./images/dynamicNFT/happy.svg");

        vm.startBroadcast();
        MoodNFT moodNFT = new MoodNFT(
            svgToImageURI(sadSvg),
            svgToImageURI(happySvg)
        );
        vm.stopBroadcast();
        return moodNFT;
    }

    function svgToImageURI(
        string memory svg
    ) public pure returns (string memory) {
        string memory baseURL = "data:image/svg+xml;base64,";
        string memory svgBased64Encoded = Base64.encode(
            bytes(abi.encodePacked(svg))
        );
        return string.concat(baseURL, svgBased64Encoded);
    }
}
