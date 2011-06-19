%% -*- mode: nitrogen -*-
-module (login).
-compile(export_all).
-include_lib("nitrogen_core/include/wf.hrl").
-include("records.hrl").

main() -> #template { file="./site/templates/login.html" }.

title() -> "Login to Publicitate!".

body() -> 
    % Validators to ensure that we've gotten a password entered.
    wf:wire(submit, password, #validate { 
        validators = [
            #is_required { text="Required." }
        ]
    }),

    % A simple login form.
    #panel { style="margin: 50px 100px;", body = [
        #flash {},
            
        #p {},
        #label { text="Password: "},
        #password { id=password, next=submit },

        % The postback on the button below is key - Nitrogen handles sending that 
        % back automatically, so we catch it as an event below.
        #p {},
        #button { text="Login", id=submit, postback=login }
    ]}.

% If a user enters the correct username/password, we grant them a session
% and they'll have access to the inner application. Not a GREAT authentication
% routine, but not necessarily horrible either. ;P
event(login) ->
    case wf:q(password) == "weloveads2011" of
        true ->
            wf:role(managers, true), 
            wf:redirect_from_login("/");
        false ->
            wf:flash("You are not authorized to access this area.")
    end.
