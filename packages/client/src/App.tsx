import { useComponentValue, useRows } from "@latticexyz/react";
import { useMUD } from "./MUDContext";
import { useNavigate } from 'react-router-dom';

export const App = () => {
  const navigate = useNavigate();
  const goToAllCities = () => {
    navigate('/AllCities');
  };
  const goToNewPlayer = () => {
    navigate('/NewPlayer');
  };
  const {
    components: { Citizens, CitizensCounter, Proposals, ProposalCounter, CitiesCounter, Voting, Cities, VerifiedCities, SupercitiesTokenTable },
    network: { singletonEntity, worldSend, storeCache },
  } = useMUD();

  const citizensCounter = useComponentValue(CitizensCounter, singletonEntity);
  const citiesCounter = useComponentValue(CitiesCounter, singletonEntity);
  const proposals = useComponentValue(Proposals, singletonEntity);
  // const superCitiesTokenTable = useRows(storeCache, { table : "SuperCitiesToken" });

  console.log(CitizensCounter);

  return (
    <div className="h-screen bg-bgd text-white pt-20 px-3 grid text-center gap-3 items-center">
        <div className='font-nab text-9xl pt-24' >Super Cities</div>
        <div> CitizenID: {Citizens?.id} </div>
        <div className='flex mx-auto gap-5'>
          <button className='border-2 mx-auto rounded-2xl text-2xl font-nova py-2 px-6 hover:bg-zen hover:text-bgd' onClick={goToNewPlayer}>New Player</button>
          <button className='border-2 mx-auto rounded-2xl text-2xl font-nova py-2 px-6 hover:bg-zen hover:text-bgd' onClick={goToAllCities}>Load Game</button>
        </div>
    </div>
  );
};
