require 'rails_helper'

RSpec.describe Task, type: :request do
  context 'good requests' do
    it 'serves a single task' do
      list = create :list
      task = create :task, name: 'Task Name', description: 'do these things', list: list
      get "/api/v1/lists/#{list.id}/tasks/#{task.id}"
      
      json = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(200)

      expect(json[:name]).to eq 'Task Name'
      expect(json[:description]).to eq 'do these things'
    end

    it 'serves tasks' do
      list = create :list
      create :task, name: 'Task Name', description: 'This is the task', list: list
      create :task, name: 'Another Task', description: 'Do this too', list: list
      get "/api/v1/lists/#{list.id}/tasks"
      json = JSON.parse(response.body, symbolize_names: true)
      expect(json.count).to eq(2)
      expect(json.first[:name]).to eq 'Task Name'
      expect(json.last[:name]).to eq 'Another Task'
    end

    it 'accepts a new task' do
      list = create :list
      task_params = attributes_for :task, name: 'Task Name', description: 'do these'
      headers = { "ACCEPT": "application/json", 'Content-Type': 'application/json' }

      post "/api/v1/lists/#{list.id}/tasks", params: { task: task_params}.to_json, headers: headers

      expect(response.status).to eq(201)

      json = JSON.parse(response.body, symbolize_names: true)

      expect(json[:name]).to eq 'Task Name'
      expect(json[:description]).to eq 'do these'
    end

    it 'updates an existing task' do
      list = create :list
      task = create :task, name: 'Initial Name', description: 'Initial description', list: list
      
      headers = { 'ACCEPT': 'application/json', 'Content-Type': 'application/json' }
      new_data = { task: { name: 'New Name', description: 'New Description', estimate: 1, completed: 1}}.to_json
      patch "/api/v1/lists/#{list.id}/tasks/#{task.id}", params: new_data, headers: headers

      expect(response.status).to eq(200)

      json = JSON.parse(response.body, symbolize_names: true)

      expect(json[:name]).to eq 'New Name'
      expect(json[:description]).to eq 'New Description'
    end

    it 'deletes an existing task' do
      list = create :list
      task = create :task

      expect { delete "/api/v1/lists/#{list.id}/tasks/#{task.id}" }.to change{ Task.count }.from(1).to(0)
    end
  end

  context 'shows good errors' do
    it 'will not create a task without parameters' do
  pending 'Error too good'
      list = create :list
      params = {nonsense: 'garbage'}.to_json
      headers = { 'ACCEPT': 'application/json', 'Content-Type': 'application/json' }

      post "/api/v1/lists/#{list.id}/tasks", params: params, headers: headers
      
      expect(response.status).to eq(500)
      json = JSON.parse(response.body, symbolize_names: true)
      expect(json[:message]).to include("Name can't be blank")
    end
  end
end
