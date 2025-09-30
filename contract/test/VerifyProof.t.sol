// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import "forge-std/Test.sol";
import "../Verifier.sol"; // HonkVerifier

contract VerifyProofTest is Test {
    HonkVerifier public verifier;
    bytes32[] public publicInputs = new bytes32[](4);

    function setUp() public {
        // deployed address from Anvil
        verifier = HonkVerifier(0x5FbDB2315678afecb367f032d93F642f64180aa3);

        // populate public inputs
        publicInputs[0] = bytes32(uint256(3));
        publicInputs[1] = bytes32(uint256(4));
        publicInputs[2] = bytes32(uint256(5));
        publicInputs[3] = bytes32(uint256(25));
    }

    function testVerifyProof() public {
        bytes memory proof = vm.readFileBinary("../circuits/target/proof");
        bool result = verifier.verify(proof, publicInputs);
        assert(result);
    }
}
