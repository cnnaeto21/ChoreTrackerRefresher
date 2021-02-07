class Chore < ApplicationRecord
    belongs_to :child
    belongs_to :task
    validates_date :due_on


    scope :by_task, -> {joins(:task).order("tasks.name")}
    scope :chronological, -> {order("due_on", "completed")}
    scope :pending, -> {where(completed: false)}
    scope :done, -> {where(completed: true)}
    scope :upcoming, -> {where("due_on >= ?", Date.current)}
    scope :past, -> {where("due_on < ?", Date.current)}


    def status
        #task = self.task
        if self.completed == true
            "Completed"
        else
            "Pending"
        end
    end
end
