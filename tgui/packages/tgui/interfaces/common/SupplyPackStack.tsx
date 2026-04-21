import { Button, Section, Stack } from 'tgui-core/components';
import { BooleanLike } from "tgui-core/react";

import { merchant_supply_pack } from "../../data_types/supply_pack";

type SupplyPackSectionProps = {
  pack: merchant_supply_pack
} & Partial<{
  on_buy: () => void;
  on_buy_txt?: string;
  /** Disables the submit button */
  disabled: boolean;
  disabled_txt?: string; 
  budget?: number;
  pricemult?: number;
  extramult?: number;
  tax_amt?: number;
  paying_tax?: BooleanLike;
  currency?: string;
}>

export const SupplyPackSection = (props: SupplyPackSectionProps) => {
  const { pack, budget, pricemult, extramult, tax_amt, paying_tax, currency, on_buy, on_buy_txt, disabled, disabled_txt } = props;
  // Don't you ever be supplying paying_taxt true without also supplying tax_amt Peta, worst mistake of your lyfe! Other way around as well!
  const finalprice = ((pack.cost * ((pricemult ? pricemult : 1)+ (extramult ? extramult : 0))) + (paying_tax? tax_amt! : 0)); 
  const CanBeBought = (budget ? finalprice <= budget : false);
  const CostColour = (CanBeBought ? "#00ff00" : "#ff0000");
  let moneytype = currency ? currency : "Mammons";
  /* const PackContents = () => {
    return (
      <Section title="Contents">
        <Stack vertical>
          {
            pack.contains.map(cont => (<Stack.Item key={cont.name}><Section title={cont.name}>{cont.desc}</Section></Stack.Item>))
          }
        </Stack>
      </Section>
    );
  };*/

  const BuyBtn = () => {
    if(disabled) {
      return (
        <Button disabled> { disabled_txt ? disabled_txt : "Unavailable" } </Button>
      );
    }
    else{
      return (
        <Button onClick={on_buy}>{on_buy_txt ? on_buy_txt : "Purchuse"}</Button>
      );
    }
  };


  return(
    <Section title={pack.name}>
      <Stack vertical>
        <Stack.Item>
          Cost: 
        </Stack.Item>
        <Stack.Item>
          <Stack.Item>
            <Stack>
              <Stack.Item>
                Base price: {pack.cost}
              </Stack.Item>
                {pricemult? "" : (<Stack.Item>Price Multiplier: {pricemult}</Stack.Item>)}
                {extramult? "" : (<Stack.Item>Commission Multiplier: {extramult}</Stack.Item>)}
                {tax_amt? "" : (paying_tax ? (<Stack.Item>Tax: {tax_amt}</Stack.Item>) : (<Stack.Item textColor="#ff0000" >Tax: {tax_amt}... in theory.</Stack.Item>))}
              <Stack.Item textColor={CostColour}>
                  Final price: {finalprice} {moneytype}
              </Stack.Item>
            </Stack>
          </Stack.Item>
        </Stack.Item>
        <Stack.Item>
          {BuyBtn()}
        </Stack.Item>
      </Stack>
    </Section>
  );

  
};
