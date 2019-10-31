LAST_COMMIT = File.exists?("REVISION") ? File.atime("REVISION").to_date.to_s : Date.today.to_s
