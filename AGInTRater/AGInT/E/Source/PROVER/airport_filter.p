% All aircraft are either in lower or in upper airspace
fof(low_up_is_exhaustive, axiom,
    (![X]:(lowairspace(X)|uppairspace(X)))).

fof(filter_equiv, conjecture, (
% Naive version: Display aircraft in the Abu Dhabi Approach area in
% lower airspace, display aircraft in the Dubai Approach area in lower
% airspace, display all aircraft in upper airspace, except for
% aircraft in military training region if they are actual military
% aircraft.  
    (![X]:(((a_d_app(X) & lowairspace(X))|(dub_app(X) & lowairspace(X))
    |uppairspace(X))&
    (~milregion(X)|~military(X))))
    <=>
% Optimized version: Display all aircraft in either Approach, display 
% aircraft in upper airspace, except military aircraft in the military
% training region 
    (![X]:((uppairspace(X) | dub_app(X) | a_d_app(X)) &
    (~military(X) | ~milregion(X)))))).
