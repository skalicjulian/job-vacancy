migration 8, :create_job_applications do
  up do
    create_table :job_applications do
      column :id, Integer, :serial => true
    end
  end

  down do
    drop_table :job_applications
  end
end