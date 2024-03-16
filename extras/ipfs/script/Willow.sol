// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;


import "filecoin-solidity-api/contracts/v0.8/utils/Actor.sol";
import "filecoin-solidity-api/contracts/v0.8/utils/Misc.sol";
import "./CBOR.sol";
import "./BytesConverter.sol";

contract WillowIPC {
    using CBOR for CBOR.CBORBuffer;
    using BytesConverter for bytes32;
    using BytesConverter for bytes;

    bytes public raw_response;
    int256 public num_response;
    bytes public buffer;

    function execute() public  {
        bytes memory se_request = _serializeRandomXParameters();

        (num_response, raw_response) = Actor.callByID(
            CommonTypes.FilActorId.wrap(49), //uint64, actor id
            3929173870, // method number
            Misc.CBOR_CODEC,
            se_request,
            0,
            false // don't mutate
        );
    }

    function _serializeRandomXParameters() private returns (bytes memory) {
        uint256 capacity = 0;

        CBOR.CBORBuffer memory buf = CBOR.create(capacity);
        buffer = buf.data();
        return buf.data();
    }

}
