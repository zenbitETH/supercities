export const NewCity = () => {
    return (
        <div className="h-screen bg-bgd text-white pt-20 px-3 text-center grid items-center gap-3">
            <div className=" mx-auto grid gap-5 border-2 border-bit p-10 rounded-3xl">
                <div className="font-nova text-3xl text-bit">Register New City</div>
                <input
                    type="text"
                    placeholder="*City Name"
                    className="mx-auto w-full bg-transparent border-b-2 border border-0 animate-pulse font-ice text-3xl"
                />
                <input
                    type="text"
                    placeholder="*Country"
                    className="mx-auto w-full bg-transparent border-b-2 border border-0 animate-pulse font-ice text-3xl"
                /> 
                <div className="font-nova text-bit text-3xl mt-5">
                  Choose a photo for the city
                </div>
                <input
                    type="file"
                    className="file-upload2"
                />
                <button className="mt-5 border-2 mx-20 font-nova text-2xl rounded-full hover:bg-bit px-4 py-2">Add city</button>
            </div>
        </div>
    )
}