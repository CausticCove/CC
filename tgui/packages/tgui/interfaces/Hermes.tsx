import { useState } from 'react';
import {
  Box,
  Button,
  Collapsible,
  Input,
  Section,
  Stack,
  TextArea,
} from 'tgui-core/components';

import { useBackend } from '../backend';
import { merchant_supply_pack } from "../data_types/supply_pack";
import { Window } from '../layouts';
import { SupplyPackSection } from "./common/SupplyPackStack";


type Data = {
  balance: number;
  paper_cost: number;
  quill_cost: number;
  letter_cost: number;
  has_tube?: boolean;
  travellingmerchant_static?: tm_static;
  travellingmerchant?: tm;
};

type tm = {
  favours: number;
  unlockedCats: string[];
  catunlockspending : number;
  currentcart: merchant_supply_pack_cat[];
}

type tm_static = {
  supplypacks: merchant_supply_pack_cat[]
}

type merchant_supply_pack_cat = {
  
}




export const Hermes = (props: any, context: any) => {
  const { act, data } = useBackend<Data>();
  const { balance, paper_cost, quill_cost, letter_cost, has_tube, travellingmerchant_static, travellingmerchant } = data;

  const [recipient, setRecipient] = useState('');
  const [sender, setSender] = useState('');
  const [letterContent, setLetterContent] = useState('');

  const canSendLetter = balance >= letter_cost && recipient.length > 0;
  const canBuyPaper = balance >= paper_cost;
  const canBuyQuill = balance >= quill_cost;
  const canSendTube = letterContent.length > 0;

  const packsByCat = travellingmerchant_static ? travellingmerchant_static.supplypacks : null;


  const addToCart = (pck : merchant_supply_pack) => {
    act("addToCart", { pckpath : pck.path });
  };
  const removeFromCart = (pck : merchant_supply_pack) => {
    
  };



  return (
    <Window title="HERMES" width={800} height={800}>
      <Window.Content scrollable>
        {/* JSON.stringify(packsByCat, null, 4)*/}
        {
        <Stack vertical fill>
          <Stack.Item>
            <Stack align="center">
              <Stack.Item>
                <Box bold inline mr={1} color={balance <= 0 ? 'bad' : 'good'}>
                  {balance} Mammon
                </Box>
              </Stack.Item>
              <Stack.Item grow>
                <Stack>
                  <Stack.Item>
                    <Button
                      compact
                      icon="scroll"
                      disabled={!canBuyPaper}
                      onClick={() => act('buy_paper')}
                    >
                      Paper ({paper_cost})
                    </Button>
                  </Stack.Item>
                  <Stack.Item>
                    <Button
                      compact
                      icon="feather"
                      disabled={!canBuyQuill}
                      onClick={() => act('buy_quill')}
                    >
                      Quill ({quill_cost})
                    </Button>
                  </Stack.Item>
                </Stack>
              </Stack.Item>
              <Stack.Item>
                <Button
                  compact
                  icon="coins"
                  color="caution"
                  disabled={balance <= 0}
                  onClick={() => act('refund')}
                >
                  Refund
                </Button>
              </Stack.Item>
            </Stack>
          </Stack.Item>

          <Stack.Item grow>
            <Section
              title={`Write Letter (${letter_cost} mammon)`}
              fill
            >
              <Stack vertical fill>
                <Stack.Item>
                  <Stack>
                    <Stack.Item grow>
                      <Input
                        fluid
                        placeholder="To: Name or #number"
                        value={recipient}
                        onChange={(value) => setRecipient(value)}
                      />
                    </Stack.Item>
                    <Stack.Item grow>
                      <Input
                        fluid
                        placeholder="From: Anonymous"
                        value={sender}
                        onChange={(value) => setSender(value)}
                      />
                    </Stack.Item>
                  </Stack>
                </Stack.Item>
                <Stack.Item grow>
                  <TextArea
                    fluid
                    height="100%"
                    placeholder="Write your letter here..."
                    value={letterContent}
                    maxLength={2000}
                    onChange={(value) => setLetterContent(value)}
                  />
                </Stack.Item>
                <Stack.Item>
                  <Stack>
                    <Stack.Item grow>
                      <Button
                        fluid
                        icon="paper-plane"
                        disabled={!canSendLetter}
                        onClick={() =>
                          act('send_letter', {
                            recipient: recipient,
                            sender: sender || 'Anonymous',
                            content: letterContent,
                          })
                        }
                      >
                        Send Letter
                      </Button>
                    </Stack.Item>
                    {has_tube && (
                      <Stack.Item grow>
                        <Button
                          fluid
                          icon="paper-plane"
                          color="teal"
                          disabled={!canSendTube}
                          onClick={() =>
                            act('send_tube', {
                              sender: sender || 'Anonymous',
                              content: letterContent,
                            })
                          }
                        >
                          Send Through Tube (Free)
                        </Button>
                      </Stack.Item>
                    )}
                  </Stack>
                </Stack.Item>
              </Stack>
            </Section>
          </Stack.Item>
          {
            packsByCat && 
            (
            <Stack.Item>
              <Collapsible title="Alternatively... you could make a few deals....">
                <Box>Current mammons worth of favours: {travellingmerchant!.favours}</Box>
                <Collapsible title="Order a drop...">
                  <Collapsible title="Current cart">
                   {/* JSON.stringify(travellingmerchant?.currentcart, null, 4)*/}
           {        
                      Object.keys(travellingmerchant!.currentcart).map((key) => (
                        <Stack scrollable vertical key={key}>
                        {
                          Object.keys(travellingmerchant!.currentcart[key]).map((pacckey) => (
                              <Stack.Item key={pacckey} style={{ marginLeft: '20px' }}>
                                  <SupplyPackSection pack={travellingmerchant!.currentcart[key][pacckey]} on_buy={() => removeFromCart(travellingmerchant!.currentcart[key][pacckey])} on_buy_txt='Remove from drop' />
                              </Stack.Item>
                          ))
                        } 
                          
                        </Stack>
                  ))
          } 
                  </Collapsible>
                  {Object.keys(packsByCat).map((key) => (
                    <Stack.Item key={key} style={{ marginLeft: '20px' }}>
                      <Collapsible title={key} style={{ backgroundColor: travellingmerchant!.unlockedCats.includes(key) ? "" : "grey" }}>
                        <Stack scrollable vertical>
                        {travellingmerchant!.unlockedCats.includes(key) ? 
                            
                              Object.keys(packsByCat[key]).map((pacckey) => (
                                <Stack.Item key={pacckey} style={{ marginLeft: '20px' }}>
                                    <SupplyPackSection pack={packsByCat[key][pacckey]} budget={travellingmerchant!.favours} currency='Favours' on_buy={() => addToCart(packsByCat[key][pacckey])} on_buy_txt='Add to drop' />
                                </Stack.Item>
                              ))
                              
                            
                          : 
                          (travellingmerchant!.catunlockspending > 0 ? <Button>Contract supplier</Button> : <Button disabled>Opportunities await...</Button>)
                          } 
                          
                        </Stack>
                      </Collapsible>
                    </Stack.Item>
                  ))
                  }
                </Collapsible>
              </Collapsible>
            </Stack.Item>)
            
          }
        </Stack>
        }
      </Window.Content>
    </Window>
  );
};
