// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;


import "filecoin-solidity-api/contracts/v0.8/utils/Actor.sol";
import "filecoin-solidity-api/contracts/v0.8/utils/Misc.sol";


contract Test {

    bytes public raw_response;
    int256 public num_response;

    function test() public  {
        bytes memory raw_request = "";

        (num_response, raw_response) = Actor.callByID(
            CommonTypes.FilActorId.wrap(49), //uint64, actor id
            0, // method number
            Misc.CBOR_CODEC,
            raw_request,
            0,
            false // don't mutate
        );
    }
}
