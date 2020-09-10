fof(f33,plain,(
    $false ),
    inference(subsumption_resolution,[],[f32,f30])).

fof(f30,plain,(
    ! [X0] : sQ1_eqProxy(X0,X0) ),
    introduced(equality_proxy_reflexivity_axiom,[])).

fof(f32,plain,(
    ~ sQ1_eqProxy(vsucc(vd33),vsucc(vd33)) ),
    inference(forward_demodulation,[],[f24,f17])).

fof(f17,plain,(
    vd33 = vd35 ),
    inference(cnf_transformation,[],[f2])).

fof(f2,axiom,(
    vd33 = vd35 ),
    file('/tmp/SystemOnTPTPFormReply28624/SOT_jJArl6','holds(prot(24),36,0)')).

fof(f24,plain,(
    ~ sQ1_eqProxy(vsucc(vd33),vsucc(vd35)) ),
    inference(equality_proxy_replacement,[],[f16])).

fof(f16,plain,(
    vsucc(vd33) != vsucc(vd35) ),
    inference(cnf_transformation,[],[f12])).

fof(f12,plain,(
    vsucc(vd33) != vsucc(vd35) ),
    inference(ennf_transformation,[],[f1])).

fof(f1,negated_conjecture,(
    vsucc(vd33) != vsucc(vd35) ),
    file('/tmp/SystemOnTPTPFormReply28624/SOT_jJArl6','holds(apod(24),37,0)')).
