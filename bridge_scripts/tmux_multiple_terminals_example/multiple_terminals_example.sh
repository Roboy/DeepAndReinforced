tmux \
new-session "/bin/sh -c 'echo "Hello_guys";echo "Tmux_is_a_nice_tool"; exec bash'" \; \
split-window "/bin/sh -c 'echo "This_program_will_help_us"; exec bash'" \; \
split-window "/bin/sh -c 'echo "to_work_in_seperate_terminals"; exec bash'" \; \
split-window "/bin/sh -c 'bash ./additional_script.sh; exec bash'" \; \
select-layout even-horizont