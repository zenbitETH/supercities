import { useNavigate } from 'react-router-dom';
import cover from '../public/citycover.jpg'

export const AllCities = () => {
  const navigate = useNavigate();
  const goToNewCity = () => {
    navigate('/NewCity');
  };

    return (
        <div className="h-screen bg-bgd text-white pt-20 px-3 grid grid-cols-12 gap-3">
            <div id="proposed" className="col-span-2">
                <button 
                onClick={goToNewCity}
                className=
                  "border-2 w-full cursor-pointer hover:bg-bit rounded-2xl h-20 mb-3 grid items-center text-center font-ice text-2xl"> 
                  🌆 New City
                </button>  
                <div className="overflow-y-auto hide-scrollbar h-[675px] border-2 rounded-2xl p-3 font-ice text-2xl">
                    <div className="grid auto-cols-auto gap-3 text-center  ">
                      <div className="bg-citycover bg-cover bg-center rounded-2xl h-52 relative">
                        <div className='absolute top-0 right-0 bg-zen text-bgd rounded-2xl p-3'>Id 1</div>
                        <div className='bg-black/50 pl-3 pt-3 text-left'>
                          <div>City Name</div>
                          <div>Country</div>
                        </div>
                        <div className='text-lg bg-black/50'>Proposed by <span className='animate-pulse'>player/address</span></div>
                        <div className='text-xl bg-white/80 text-bgd '>Does this city exist IRL?</div>
                        <div className='text-lg bg-white/80 grid grid-cols-2 py-2'>
                          <div className='text-bgd hover:bg-bit/70 rounded-full mx-auto px-3 hover:text-white cursor-pointer'><span>1 </span>✅</div>
                          <div className='text-bgd hover:bg-bit/70 rounded-full mx-auto px-3 hover:text-white cursor-pointer'><span>1 </span>❌</div>
                        </div>
                        <div className='text-lg bg-black/50'><span className='animate-pulse'>7 days to vote</span> </div>
                      </div>

                    </div>
                </div>
            </div>
            <div className="border-2 rounded-2xl col-span-10 p-3 h-[768px] font-ice">
              <div className="rounded-2xl py-7 flex items-center text-center text-2xl justify-center gap-5">
                <div className="cursor-pointer hover:text-bit">Country 1</div>
                <div className="cursor-pointer hover:text-bit">Country 2</div>
              </div>
              <div className="overflow-y-auto hide-scrollbar h-[675px] rounded-2xl font-ice text-2xl ">
                  <div className="grid auto-cols-auto gap-3 text-center grid-cols-5  ">
                    <div className="bg-citycover bg-cover bg-center rounded-2xl h-52 relative">
                      <div className='absolute top-0 right-0 bg-bit rounded-2xl p-3 text-lg leading-5	'>
                        <div>Id 0</div>
                        <div>Level 1</div>
                      </div>
                      <div className='bg-black/50 pl-3 pt-3 text-left'>
                        <div>City Name</div>
                        <div>Country</div>
                        <div className='grid grid-cols-3 text-center items-center text-3xl'>
                          <div className='py-3 rounded-full bg-gradient-to-r from-white/0 via-white/25 to-white/0'>2 👤</div>
                          <div className='py-3 rounded-full bg-gradient-to-r from-white/0 via-white/25 to-white/0'>1 ⛲</div>
                          <div className='py-3 rounded-full bg-gradient-to-r from-white/0 via-white/25 to-white/0'>1 🏪</div>
                        </div>
                        <div className='text-center py-4'>
                          <button className='border-2 rounded-full py-1 px-4 hover:bg-zen hover:text-bgd cursor-pointer'>Commit</button>
                        </div>
                      </div>
                      <div></div>

                    </div>

                  </div>
              </div>
            </div>
        </div>
    )
}