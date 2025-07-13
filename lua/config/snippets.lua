local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

-- Define Blade directives
local blade_directives = {
	-- Opening directives with descriptions
	["@if"] = "if statement",
	["@for"] = "for loop",
	["@csrf"] = "CSRF token",
	["@foreach"] = "foreach loop",
	["@forelse"] = "forelse loop",
	["@else"] = "else clause",
	["@elseif"] = "elseif clause",
	["@section"] = "section definition",
	["@extends"] = "template extension",
	["@yield"] = "yield content",
	["@include"] = "include template",
	["@component"] = "component definition",
	["@slot"] = "slot content",
	["@continue"] = "continue loop",
	["@break"] = "break loop",
	["@isset"] = "check if set",
	["@empty"] = "check if empty",
	["@auth"] = "auth check",
	["@guest"] = "guest check",
	["@method"] = "HTTP method",
	["@route"] = "route helper",
	["@json"] = "JSON output",
	["@php"] = "PHP code block",
	["@push"] = "push content to a stack",
	["@prepend"] = "prepend content to a stack",
	["@stack"] = "render stack content",
	["@error"] = "display form validation errors",
	["@verbatim"] = "output raw HTML without Blade compilation",
	["@env"] = "retrieve the value of an environment variable",
	["@unless"] = "conditional clause that works like !if",
	["@can"] = "check if a user has permission",
	["@cannot"] = "check if a user cannot perform an action",

	-- Closing directives with descriptions
	["@endif"] = "end of if statement",
	["@endfor"] = "end of for loop",
	["@endforeach"] = "end of foreach loop",
	["@endforelse"] = "end of forelse loop",
	["@endsection"] = "end of section",
	["@endextends"] = "end of extends",
	["@endyield"] = "end of yield content",
	["@endinclude"] = "end of include template",
	["@endcomponent"] = "end of component definition",
	["@endslot"] = "end of slot content",
	["@endcontinue"] = "end of continue loop",
	["@endbreak"] = "end of break loop",
	["@endisset"] = "end of isset check",
	["@endempty"] = "end of empty check",
	["@endauth"] = "end of auth check",
	["@endguest"] = "end of guest check",
	["@endmethod"] = "end of HTTP method",
	["@endroute"] = "end of route helper",
	["@endjson"] = "end of JSON output",
	["@endphp"] = "end of PHP code block",
	["@endpush"] = "end of push content to a stack",
	["@endprepend"] = "end of prepend content to a stack",
	["@endverbatim"] = "end of raw HTML output",
	["@endunless"] = "end of unless statement",
	["@endcan"] = "end of can check",
	["@endcannot"] = "end of cannot check",
}

-- Table to store all snippets
local blade_snippets = {}

-- Process each directive to create appropriate snippets
for directive, description in pairs(blade_directives) do
	-- Check if it's an opening directive (doesn't start with @end)
	if not directive:match("^@end") then
		-- For opening directives that typically have parameters
		if directive == "@if" or directive == "@elseif" or directive == "@for" or
		    directive == "@foreach" or directive == "@forelse" or directive == "@include" or
		    directive == "@component" or directive == "@extends" or directive == "@section" or
		    directive == "@push" or directive == "@prepend" or directive == "@error" or
		    directive == "@unless" or directive == "@can" or directive == "@cannot" or
		    directive == "@env" or directive == "@method" or directive == "@isset" or
		    directive == "@empty" then
			blade_snippets[#blade_snippets + 1] = s(directive, {
				t(directive .. "("),
				i(1, ""),
				t(")"),
			}, { descr = description }) -- Add description here
		else
			-- For directives without parameters
			blade_snippets[#blade_snippets + 1] = s(directive, {
				t(directive),
			}, { descr = description }) -- Add description here
		end
	else
		-- For closing directives (simple, no insert nodes)
		blade_snippets[#blade_snippets + 1] = s(directive, {
			t(directive),
		}, { descr = description }) -- Add description here
	end
end

-- Add all snippets to the blade filetype
ls.add_snippets("blade", blade_snippets)
local c = ls.choice_node

-- Common Laravel Blade helpers with descriptions
local laravel_helpers = {
	-- Asset helpers
	["asset"] = "Generate URL for an asset",
	["url"] = "Generate a fully qualified URL",
	["secure_asset"] = "Generate URL for an asset using HTTPS",
	["secure_url"] = "Generate HTTPS URL",
	["mix"] = "Get URL for a versioned Mix file",
	["vite"] = "Get URL for a Vite asset",

	-- Route helpers
	["route"] = "Generate URL for a named route",
	["action"] = "Generate URL for a controller action",

	-- String helpers
	["__"] = "Translate a string",
	["trans"] = "Translate a string",
	["trans_choice"] = "Translate a plural string",

	-- Config helpers
	["config"] = "Get a configuration value",
	["env"] = "Get an environment variable",

	-- Auth helpers
	["auth"] = "Get the authenticated user",

	-- Session helpers
	["session"] = "Get a session value",
	["old"] = "Get old input value",

	-- App helpers
	["app"] = "Get the app container instance",
	["resolve"] = "Resolve an instance from the container",

	-- Collection helpers
	["collect"] = "Create a collection from an array",

	-- Request helpers
	["request"] = "Get the request instance or input item",

	-- Response helpers
	["response"] = "Create a response instance",

	-- View helpers
	["view"] = "Create a view instance",

	-- Form helpers
	["csrf_field"] = "Generate a CSRF token hidden field",
	["method_field"] = "Generate a method spoof hidden field",

	-- Storage helpers
	["storage_path"] = "Get the path to a storage file",
	["storage"] = "Get a storage disk instance",

	-- Misc helpers
	["dd"] = "Dump and die - debug helper",
	["dump"] = "Dump a variable for debugging",
	["now"] = "Get a Carbon instance for the current time",
}

-- Create all the snippets
local blade_expression_snippets = {}
for trigger, description in pairs(laravel_helpers) do
	-- Create two variants and let the user choose
	blade_expression_snippets[#blade_expression_snippets + 1] = s(trigger, {
		c(1, {
			-- Option 1: With {{ }}
			{
				t("{{ " .. trigger .. "("),
				i(1, ""),
				t(") }}")
			},
			-- Option 2: Without {{ }}
			{
				t(trigger .. "("),
				i(1, ""),
				t(")")
			}
		})
	}, { descr = description })
end

-- Add all the snippets to the blade filetype
ls.add_snippets("blade", blade_expression_snippets)
