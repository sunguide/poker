module.exports = app => {
    const mongoose = app.mongoose;
    const schema = new mongoose.Schema({
        app_id: {type: String},
        logs: {type: String},
        scheduleTime: {type: String},
    },{timestamps: true});

    return mongoose.model('jobs', schema);
}
