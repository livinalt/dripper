import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

const LiskTokenModule = buildModule("LiskTokenModule", (m) => {

  const liskToken = m.contract("LiskToken", []);

  return { liskToken };
  
});

export default LiskTokenModule;
