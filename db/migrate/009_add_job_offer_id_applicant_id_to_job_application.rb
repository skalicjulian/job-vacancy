migration 9, :add_job_offer_id_applicant_id_to_job_application do
  up do
    modify_table :job_applications do
      add_column :user_id, Integer
      add_column :job_offer_id, Integer
    end
  end

  down do
    modify_table :job_applications do
      drop_column :user_id
      drop_column :job_offer_id, Integer
    end
  end
end
