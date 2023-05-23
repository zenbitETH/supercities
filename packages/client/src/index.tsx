import ReactDOM from "react-dom/client";
import "./styles/index.css"
//import { mount as mountDevTools } from "@latticexyz/dev-tools";
import { App } from "./App";
import { setup } from "./mud/setup";
import { MUDProvider } from "./MUDContext";
import { Header } from "./components/Header";
import { BrowserRouter as Router, Route, Routes } from "react-router-dom";
import { AllCities } from "./pages/AllCities";
import { NewPlayer } from "./pages/NewPlayer";
import { NewCity } from "./pages/NewCity";

const rootElement = document.getElementById("react-root");
if (!rootElement) throw new Error("React root not found");
const root = ReactDOM.createRoot(rootElement);

// TODO: figure out if we actually want this to be async or if we should render something else in the meantime
setup().then((result) => {
  root.render(
    <MUDProvider value={result}>
      <Router>
          <Header />
          <Routes>
            <Route path="/" element={<App />} />
            <Route path="/AllCities" element={<AllCities/>} />
            <Route path="/NewPlayer" element={<NewPlayer/>} />
            <Route path="/NewCity" element={<NewCity/>} />
          </Routes>
        </Router>
    </MUDProvider>
  );
  //mountDevTools();
});
