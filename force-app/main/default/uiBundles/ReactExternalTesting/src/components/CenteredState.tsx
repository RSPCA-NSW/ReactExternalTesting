export function CenteredState({children}: { children: React.ReactNode}){
    return (
        <div className="flex items-center justify-center min-h-[50vh]">
            {children}
        </div>
    );
}