export const NewPlayer = () => {
    return (
        <div className="h-screen bg-bgd text-white pt-20 px-3 text-center grid items-center gap-3">
            <div className=" mx-auto grid gap-5 border-2 border-zen p-10 rounded-3xl">
                <div className="font-nova text-3xl text-zen">Hi anon, whats your name?</div>
                <input
                      type="text"
                      placeholder="My name is... (optional)"
                      className="mx-auto w-full bg-transparent border-b-2 border border-0 animate-pulse font-ice text-2xl"
                />
                <div className="font-nova text-3xl mt-5 text-zen">
                  Choose a profile photo
                </div>
                <input
                    type="file"
                    className="file-upload"
                />
                <button className="mt-5 border-2 mx-24 font-nova text-2xl rounded-full hover:bg-zen hover:text-bgd py-2">Sign Up</button>
            </div>
        </div>
    )
}