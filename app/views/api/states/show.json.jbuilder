json.state do
    json.state_id @state.id
    json.ontime @state.ontime
    json.overtime @state.overtime
    json.late @state.late
end