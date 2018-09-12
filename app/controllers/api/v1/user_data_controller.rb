module Api
  module V1
    class UserDataController < ApplicationController

      def send_data
        begin
          user = User.find(params[:id]);
          tr = user.transaction_histories.order(updated_at: :desc)
            data = {
              user: {
                user_id: user.id,
                name: user.name,
                point: user.points,
                trascations: tr,
              }
            }
            render json: { 
                        status: 'SUCCESS',  
                        data: data
                      },
                status: :ok
        rescue Exception => e
          render  json: { 
                      status: 'ERROR', 
                      data: data
                    },
              status: :unprocessable_entity
        end
      end
    end
  end
end
