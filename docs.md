  "gateway_addr": "0x7226EF1e479EeAa805859125a0B11b846054cc03",
  "registry_addr": "0xc92058Aa735800750939cE40427CA8134f848e74"

Wallet 1: 0x6a16ef1b602929f82ca45bc68fbf76966d510b9b

ipc-cli wallet set-default --address 0x6a16ef1b602929f82ca45bc68fbf76966d510b9b --wallet-type evm

ipc-cli subnet create --parent /r314159 --min-validator-stake 1 --min-validators 1 --bottomup-check-period 300 --from 0x6a16ef1b602929f82ca45bc68fbf76966d510b9b --permission-mode collateral --supply-source-kind native

/r314159/t410fndouy3y4askvhmwzfmrex43lo54kaqszjolx7fi

ipc-cli wallet pub-key --wallet-type evm --address 0x6a16ef1b602929f82ca45bc68fbf76966d510b9b

Pub: 047e14e96eb37765e2bc4923fcbf07e8ed7c11f483ad7d2a7385b5654320b9e940b9caa958f91054364c99e8fadef9812521e0af74188d86d3495d000f70916c26

ipc-cli subnet join --from=0x6a16ef1b602929f82ca45bc68fbf76966d510b9b --subnet=/r314159/t410fndouy3y4askvhmwzfmrex43lo54kaqszjolx7fi --collateral=10 --public-key=047e14e96eb37765e2bc4923fcbf07e8ed7c11f483ad7d2a7385b5654320b9e940b9caa958f91054364c99e8fadef9812521e0af74188d86d3495d000f70916c26 --initial-balance 1

ipc-cli wallet export --wallet-type evm --address 0x6a16ef1b602929f82ca45bc68fbf76966d510b9b --hex > ~/.ipc/validator_1.sk


cargo make --makefile infra/fendermint/Makefile.toml \
    -e NODE_NAME=validator-1 \
    -e PRIVATE_KEY_PATH=/Users/ivansala/.ipc/validator_1.sk \
    -e SUBNET_ID=/r314159/t410fndouy3y4askvhmwzfmrex43lo54kaqszjolx7fi \
    -e CMT_P2P_HOST_PORT=26656 \
    -e CMT_RPC_HOST_PORT=26657 \
    -e ETHAPI_HOST_PORT=8545 \
    -e RESOLVER_HOST_PORT=26655 \
    -e PARENT_GATEWAY=`curl -s https://raw.githubusercontent.com/consensus-shipyard/ipc/cd/contracts/deployments/r314159.json | jq -r '.gateway_addr'` \
    -e PARENT_REGISTRY=`curl -s https://raw.githubusercontent.com/consensus-shipyard/ipc/cd/contracts/deployments/r314159.json | jq -r '.registry_addr'` \
    -e FM_PULL_SKIP=1 \
    child-validator



#################################
#                               #
# Subnet node ready! 🚀         #
#                               #
#################################

Subnet ID:
        /r314159/t410fndouy3y4askvhmwzfmrex43lo54kaqszjolx7fi

Eth API:
        http://0.0.0.0:8545

Chain ID:
        1263300829813651

Fendermint API:
        http://localhost:26658

CometBFT API:
        http://0.0.0.0:26657

CometBFT node ID:
        a212b7eed4cb1e828d6636f4b0f9aafb1cb8050a

CometBFT P2P:
        http://0.0.0.0:26656

IPLD Resolver Multiaddress:
        /ip4/0.0.0.0/tcp/26655/p2p/16Uiu2HAmUANNAdhy2twRrXrpk7pDhSBTorTSCbDhSarhes6naB55
