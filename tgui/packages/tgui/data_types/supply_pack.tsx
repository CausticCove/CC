import { atom_basic } from "./atom_basic";
import { datum_basic } from "./datum_basic";

export type merchant_supply_pack = datum_basic & {
  group: string;
  cost: number;
}
