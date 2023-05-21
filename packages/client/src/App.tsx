//import { useComponentValue } from "@latticexyz/react";
//import { useMUD } from "./MUDContext";
import { useNavigate } from 'react-router-dom';

export const App = () => {
  const navigate = useNavigate();
  const goToAllCities = () => {
    navigate('/AllCities');
  };
  const goToNewPlayer = () => {
    navigate('/NewPlayer');
  };
// const {
//    components: { Counter },
//    systemCalls: { increment },
//    network: { singletonEntity },
//  } = useMUD();
//
//  const counter = useComponentValue(Counter, singletonEntity);

  return (
    <div className="h-screen bg-bgd text-white pt-20 px-3 grid text-center gap-3 items-center">
        <div className='font-nab text-9xl pt-24' >Super Cities</div>
        <div className='flex mx-auto gap-5'>
          <button className='border-2 mx-auto rounded-2xl text-2xl font-nova py-2 px-6 hover:bg-zen hover:text-bgd' onClick={goToNewPlayer}>New Player</button>
          <button className='border-2 mx-auto rounded-2xl text-2xl font-nova py-2 px-6 hover:bg-zen hover:text-bgd' onClick={goToAllCities}>Load Game</button>
        </div>
    </div>
  );
};
