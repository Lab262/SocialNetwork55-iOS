def common_pods
    # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
    inhibit_all_warnings!
    use_frameworks!

    pod 'Fabric'
    pod 'Crashlytics'
    pod 'Parse'

end

target 'lab262.55lab.socialnetwork.dev' do
    common_pods
end

target 'lab262.55lab.socialnetwork.test' do
    common_pods
end

target 'lab262.55lab.socialnetwork.production' do
    common_pods
end

target 'SocialNetwork55LabTests' do
    inherit! :search_paths
    common_pods
    # Pods for testing
end
