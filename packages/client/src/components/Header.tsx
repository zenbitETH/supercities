import photo from '../public/profile.png'

export function Header() {
    return (
        <div className="fixed top-3 z-10 w-full flex items-center text-center relative font-nova text-xl text-white">
            <div className="player-hud">
                <div className="player bg-gradient-to-l from-white/0 to-zen  grid-cols-3 grid">
                    <div className="h-16 w-16 rounded-full">
                        <img src={photo} className='rounded-full' />
                    </div>
                    <div className="col-span-2 pr-3">
                        <div>Name/Address</div>
                        <div>Level 0</div>
                    </div>
                </div>
                <div className="player hover:bg-zen hover:text-bgd cursor-pointer border-2 px-3 text-center">Commit to city</div>
            </div>
            <div className="points-hud gap-x-3">
                <div className="points grid-cols-2 ">
                    <div className="row-span-2 text-3xl">🌆</div>
                    <div>0 <span className="text-sm">✅</span> </div>
                    <div>0 <span className="text-sm">🏗️</span> </div>
                </div>
                <div className="points row-span-2 text-2xl px-1">10 points</div>
                <div className="points row-span-2 text-2xl px-1">10 tokens</div>
                {/*
                <div className="points">
                    <div className="row-span-2 text-3xl">⛲</div>
                    <div>0 <span className="text-sm" >✅</span></div>
                    <div>0 <span className="text-sm" >🏗️</span></div>
                </div>
                <div className="points">
                    <div className="row-span-2 text-3xl">🏪</div>
                    <div>0 <span className="text-sm" >✅</span></div>
                    <div>0 <span className="text-sm" >🏗️</span></div>
                </div>
                */}
            </div>
        </div>
    );
}