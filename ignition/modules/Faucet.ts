import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

const FaucetModule = buildModule("FaucetModule", (m) => {

  const liskTokenAddress = "0x524bf1ef9fE1dd03096d3041Ad6C3e88f2d86830";

  const faucet = m.contract("Faucet", [liskTokenAddress]);

  return { faucet };

});

export default FaucetModule;
