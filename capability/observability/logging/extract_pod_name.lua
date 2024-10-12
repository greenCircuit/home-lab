function extract_pod_name(tag, timestamp, record)
    -- Assuming the full log file path is available in the "filepath" key of the record
    local log_path = record["filepath"]

    -- Extract the folder name (second-to-last component of the path)
    local folder_name = log_path:match(".*/(.-)/[^/]*$")

    -- Add the folder name to the record
    if folder_name then
        record["folder_name"] = folder_name
    end

    return 1, timestamp, record
end