import { ethers } from "hardhat";

const helper = async (victim: any, attacker: any) => {
  const attackerFactory = await ethers.getContractFactory("AttackingCoinFlip");
  const attackContract = await attackerFactory.attach(attacker.address);

  for (let i = 0; i < 10; i++) {
    await attackContract.hackContract();
  }
};

export default helper;
