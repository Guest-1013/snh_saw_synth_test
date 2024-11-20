declare options "[midi:on]";
import("stdfaust.lib");

gain = hslider("gain",0.5,0,1,0.01);
freq = hslider("freq",200,50,1000,0.01);
gate = button("gate");
alias = hslider("alias", 0.01, 0.01, 0.99, 0.01);
midi_phasor = os.phasor(1.0, freq)+alias;
osc = os.sawtooth(freq)*gain*gate;

process = midi_phasor, osc : ba.sAndH <: _,_;