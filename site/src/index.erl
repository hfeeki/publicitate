%% -*- mode: nitrogen -*-
-module (index).
-compile(export_all).
-include_lib("nitrogen_core/include/wf.hrl").
-include_lib("epgsql/include/psql.hrl").

% If the current session is not set up to manage ads, kick
% them over to the login screen...
main() -> 
    case wf:role(managers) of
        true -> 
            #template { file="./site/templates/admin.html" };
        false ->
            wf:redirect_to_login("/login")
    end
.

title() -> "Publicitate!".

% Personally not a fan of Erlang syntax in general, I've gotta say...
body() ->
    {ok, C} = pgsql:connect('localhost', wf:config('db_username'), wf:config('db_password'), [database, "ads"]).
    #container_12 { body=[
        #grid_8 { 
            alpha = true, 
            prefix = 2, 
            suffix = 2, 
            omega = true, 
            body = inner_body()
        }
    ]}
. % Seriously, wtf?

% The basics...
% This gets lazy and repositions the buttons with CSS. Deal with it, it's an admin interface.
inner_body() -> [
    #h1 { text="Bert!" },
    #button { text = "Logout", id=logout, postback=logout },
    #button { text = "Add a new Ad", id=newad, postback=addnewad }
].

% If they log out, we need to clear the session and THEN REDIRECT. logout() as a term
% implies something that's actually not the case here (e.g, no redirect is handled for you). ;P
event(logout) -> 
    wf:logout(),
    wf:redirect_to_login("/login").

% If they click the "Add a new Ad" button, this event will get a postback.
event(addnewad) -> wf:redirect("/add_new_ad").
