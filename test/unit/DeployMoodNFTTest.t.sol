// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {MoodNFT} from "../../src/MoodNFT.sol";
import {DeployMoodNFT} from "../../script/DeployMoodNFT.s.sol";

contract DeployMoodNFTTest is Test {
    DeployMoodNFT public deployer;

    function setUp() public {
        deployer = new DeployMoodNFT();
    }

    function testSVGToURI() public view {
        string
            memory expectedURI = "data:image/svg+xml;base64,PHN2ZyB2aWV3Qm94PSIwIDAgMjAwIDIwMCIgd2lkdGg9IjQwMCIgIGhlaWdodD0iNDAwIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPjxjaXJjbGUgY3g9IjEwMCIgY3k9IjEwMCIgZmlsbD0iZ3JlZW4iIHI9Ijc4IiBzdHJva2U9ImJsYWNrIiBzdHJva2Utd2lkdGg9IjMiLz48ZyBjbGFzcz0iZXllcyI+PGNpcmNsZSBjeD0iNjEiIGN5PSI4MiIgcj0iMTIiLz48Y2lyY2xlIGN4PSIxMjciIGN5PSI4MiIgcj0iMTIiLz48L2c+PHBhdGggZD0ibTEzNi44MSAxMTYuNTNjLjY5IDI2LjE3LTY0LjExIDQyLTgxLjUyLS43MyIgc3R5bGU9ImZpbGw6bm9uZTsgc3Ryb2tlOiBibGFjazsgc3Ryb2tlLXdpZHRoOiAzOyIvPjwvc3ZnPg==";
        string
            memory svg = '<svg viewBox="0 0 200 200" width="400"  height="400" xmlns="http://www.w3.org/2000/svg"><circle cx="100" cy="100" fill="green" r="78" stroke="black" stroke-width="3"/><g class="eyes"><circle cx="61" cy="82" r="12"/><circle cx="127" cy="82" r="12"/></g><path d="m136.81 116.53c.69 26.17-64.11 42-81.52-.73" style="fill:none; stroke: black; stroke-width: 3;"/></svg>';

        string memory actualURI = deployer.svgToImageURI(svg);

        assert(
            keccak256(abi.encodePacked(expectedURI)) ==
                keccak256(abi.encodePacked(actualURI))
        );
    }
}
